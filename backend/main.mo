import Int "mo:base/Int";
import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Text "mo:base/Text";

actor {
    // Type definition for an appointee
    public type Appointee = {
        position: Text;
        name: Text;
        imageUrl: Text;
    };

    // Stable storage for appointees
    private stable var appointees : [Appointee] = [
        { position = "Vice President"; name = "JD Vance"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/4/4c/J.D._Vance_official_portrait.jpg" },
        { position = "Secretary of State"; name = "Marco Rubio"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/7/79/Marco_Rubio_official_portrait_2021.jpg" },
        { position = "Attorney General"; name = "Matt Gaetz"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/8/89/Matt_Gaetz_official_photo_116th_Congress.jpg" },
        { position = "Defense Secretary"; name = "Pete Hegseth"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/3/3c/Pete_Hegseth_by_Gage_Skidmore.jpg" },
        { position = "Secretary of Homeland Security"; name = "Kristi Noem"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/c/c1/Kristi_Noem_official_photo.jpg" },
        { position = "Director of National Intelligence"; name = "Tulsi Gabbard"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/2/2a/Tulsi_Gabbard%2C_official_portrait%2C_116th_Congress.jpg" },
        { position = "National Security Advisor"; name = "Mike Waltz"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/5/53/Michael_Waltz_official_portrait.jpg" },
        { position = "CIA Director"; name = "John Ratcliffe"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/4/4c/John_Ratcliffe_official_photo.jpg" },
        { position = "White House Chief of Staff"; name = "Susie Wiles"; imageUrl = "https://placehold.co/400x500" },
        { position = "EPA Administrator"; name = "Lee Zeldin"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/8/86/Lee_Zeldin_official_portrait.jpg" },
        { position = "Ambassador to the United Nations"; name = "Elise Stefanik"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/8/84/Elise_Stefanik_official_portrait.jpg" },
        { position = "White House Counsel"; name = "Bill McGinley"; imageUrl = "https://placehold.co/400x500" },
        { position = "Deputy Chief of Staff"; name = "Stephen Miller"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/8/89/Stephen_Miller_by_Gage_Skidmore.jpg" },
        { position = "Border Czar"; name = "Tom Homan"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/1/1d/Thomas_D._Homan.jpg" },
        { position = "Ambassador to Israel"; name = "Mike Huckabee"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/9/91/Mike_Huckabee_by_Gage_Skidmore_8.jpg" },
        { position = "Government Efficiency Advisor"; name = "Elon Musk"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg" },
        { position = "Government Efficiency Advisor"; name = "Vivek Ramaswamy"; imageUrl = "https://upload.wikimedia.org/wikipedia/commons/f/f9/Vivek_Ramaswamy_%282023%29.jpg" },
        { position = "Middle East Envoy"; name = "Steve Witkoff"; imageUrl = "https://placehold.co/400x500" }
    ];

    // Query function to get all appointees
    public query func getAppointees() : async [Appointee] {
        appointees
    };

    // Query function to search appointees
    public query func searchAppointees(term: Text) : async [Appointee] {
        let searchTerm = Text.toLowercase(term);
        Array.filter<Appointee>(appointees, func(appointee) {
            let nameMatch = Text.contains(Text.toLowercase(appointee.name), #text searchTerm);
            let positionMatch = Text.contains(Text.toLowercase(appointee.position), #text searchTerm);
            nameMatch or positionMatch
        })
    };
}
