import ballerina/http;
import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "GraphQL",
    id: "GraphQL-115b0af1-daab-4971-8c8f-526550c5704d"
}
service / on new graphql:Listener(8090) {

    @display {
        label: "Shipping",
        id: "Shipping-a17bfeb1-07ad-42a5-b967-d6c616faf962"
    }
    http:Client shippingClient;

    function init() returns error? {
        self.shippingClient = check new ("");
    }

    # A resource for generating greetings
    # Example query:
    # query GreetWorld{ 
    # greeting(name: "World") 
    # }
    # Curl command: 
    # curl -X POST -H "Content-Type: application/json" -d '{"query": "query GreetWorld{ greeting(name:\"World\") }"}' http://localhost:8090
    #
    # + name - the input string name
    # + return - string name with greeting message or error
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
