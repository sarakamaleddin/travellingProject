<?php
require("includes/header.php");
require "conf/config.php";
?>
<?php
if(!isset($_SERVER['HTTP_REFERE'])){
    header('location: http://localhost:8077/travellingProject/index.php');
    exit;
}
?>
<div class="container">
    <!-- Replace "test" with your own sandbox Business account app client ID -->
    <script src="https://www.paypal.com/sdk/js?client-id=AbrDmIaxUI3vH50zQa85Pns03q6VrdbJv57T3G99CZU-HF6l12l4AnOSFrD18Qf9nvKOVmogiM4Nu_Jp&currency=USD"></script>
    <!-- Set up a container element for the button -->
    <div  style="margin-top: 250px;" id="paypal-button-container"></div>
    <script>
        paypal.Buttons({
            // Sets up the transaction when a payment button is clicked
            createOrder: (data, actions) => {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: "<?php echo $_SESSION['payment']; ?>" // Can also reference a variable or function
                        }
                    }]
                });
            },
            // Finalize the transaction after payer approval
            onApprove: (data, actions) => {
                return actions.order.capture().then(function(orderData) {

                    window.location.href = 'index.php';
                });
            }
        }).render('#paypal-button-container');
    </script>

</div>
</div>
</div>
<?php require("includes/footer.php") ?>