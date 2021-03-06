paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
      sandbox: 'AT-D7ex2hH9Kd0hwfirtQZPWmIK8Y3xTL1Sbmm2gKs3bn2YbYvTeyiUw2mtnvQs_rc5BrN2JnmuQiYa6',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'small',
      color: 'gold',
      shape: 'pill',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: '0.01',
            currency: 'USD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // call some dart function
        window.parent.callDartFunc();
      });
    }
  }, '#paypal-button');