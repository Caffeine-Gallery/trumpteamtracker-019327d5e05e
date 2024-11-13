import Int "mo:base/Int";
import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Text "mo:base/Text";

actor {
    public type Appointee = {
        position: Text;
        name: Text;
        imageUrl: Text;
    };

    private stable var appointees : [Appointee] = [
        { position = "Vice President"; name = "JD Vance"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=JD+Vance" },
        { position = "Secretary of State"; name = "Marco Rubio"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Marco+Rubio" },
        { position = "Attorney General"; name = "Matt Gaetz"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Matt+Gaetz" },
        { position = "Defense Secretary"; name = "Pete Hegseth"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Pete+Hegseth" },
        { position = "Secretary of Homeland Security"; name = "Kristi Noem"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Kristi+Noem" },
        { position = "Director of National Intelligence"; name = "Tulsi Gabbard"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Tulsi+Gabbard" },
        { position = "National Security Advisor"; name = "Mike Waltz"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Mike+Waltz" },
        { position = "CIA Director"; name = "John Ratcliffe"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=John+Ratcliffe" },
        { position = "White House Chief of Staff"; name = "Susie Wiles"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Susie+Wiles" },
        { position = "EPA Administrator"; name = "Lee Zeldin"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Lee+Zeldin" },
        { position = "Ambassador to the United Nations"; name = "Elise Stefanik"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Elise+Stefanik" },
        { position = "White House Counsel"; name = "Bill McGinley"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Bill+McGinley" },
        { position = "Deputy Chief of Staff"; name = "Stephen Miller"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Stephen+Miller" },
        { position = "Border Czar"; name = "Tom Homan"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Tom+Homan" },
        { position = "Ambassador to Israel"; name = "Mike Huckabee"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Mike+Huckabee" },
        { position = "Government Efficiency Advisor"; name = "Elon Musk"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg" },
        { position = "Government Efficiency Advisor"; name = "Vivek Ramaswamy"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Vivek+Ramaswamy" },
        { position = "Middle East Envoy"; name = "Steve Witkoff"; imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Steve+Witkoff" }
    ];

    public query func getAppointees() : async [Appointee] {
        appointees
    };

    public query func searchAppointees(term: Text) : async [Appointee] {
        let searchTerm = Text.toLowercase(term);
        Array.filter<Appointee>(appointees, func(appointee) {
            let nameMatch = Text.contains(Text.toLowercase(appointee.name), #text searchTerm);
            let positionMatch = Text.contains(Text.toLowercase(appointee.position), #text searchTerm);
            nameMatch or positionMatch
        })
    };
}
