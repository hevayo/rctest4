import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Shipping",
    id: "Shipping-a17bfeb1-07ad-42a5-b967-d6c616faf962"
}
service / on new http:Listener(9090) {
    @display {
        label: "shippingdb",
        id: "mysql"
    }
    mysql:Client mysqlEp;

    @display {
        label: "Tracking",
        id: "Tracking-396db269-5d88-4c38-8b87-7a2948fb1eef"
    }
    http:Client trackingClient;

    function init() returns error? {
        self.mysqlEp = check new ();
        self.trackingClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get orders(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }

    resource function post orders(@http:Payload string payload) returns error?|string {
        return "sample";
    }
}
