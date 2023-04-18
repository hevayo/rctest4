import ballerina/http;
import ballerinax/trigger.shopify;

configurable shopify:ListenerConfig config = ?;

listener shopify:Listener webhookListener = new (config);

@display {
    label: "OrdersService",
    id: "OrdersService"
}
service shopify:OrdersService on webhookListener {

    @display {
        label: "Shipping",
        id: "Shipping-a17bfeb1-07ad-42a5-b967-d6c616faf962"
    }
    http:Client shippingClient;

    function init() returns error? {
        self.shippingClient = check new ("");
    }

    remote function onOrdersCreate(shopify:OrderEvent event) returns error? {
        string response = check self.shippingClient->/orders.get( );
    }
    remote function onOrdersCancelled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersFulfilled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersPaid(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersPartiallyFulfilled(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
    remote function onOrdersUpdated(shopify:OrderEvent event) returns error? {
        // Not Implemented
    }
}

