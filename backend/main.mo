import Int "mo:base/Int";
import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Text "mo:base/Text";

actor {
    public type Appointee = {
        position: Text;
        name: Text;
        imageUrl: Text;
        biography: Text;
        previousExperience: Text;
        education: Text;
    };

    private stable var appointees : [Appointee] = [
        { 
            position = "Vice President";
            name = "JD Vance";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=JD+Vance";
            biography = "Author of 'Hillbilly Elegy' and U.S. Senator from Ohio";
            previousExperience = "U.S. Senator (R-OH), Venture Capitalist";
            education = "Yale Law School, J.D.";
        },
        { 
            position = "Secretary of State";
            name = "Marco Rubio";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Marco+Rubio";
            biography = "Senior United States Senator from Florida";
            previousExperience = "U.S. Senator, Florida House Speaker";
            education = "University of Miami Law School";
        },
        { 
            position = "Attorney General";
            name = "Matt Gaetz";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Matt+Gaetz";
            biography = "U.S. Representative from Florida's 1st District";
            previousExperience = "Florida House of Representatives";
            education = "William & Mary Law School";
        },
        { 
            position = "Defense Secretary";
            name = "Pete Hegseth";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Pete+Hegseth";
            biography = "Former Fox News host and military veteran";
            previousExperience = "Fox News Host, Army National Guard Officer";
            education = "Princeton University, Harvard Kennedy School";
        },
        { 
            position = "Secretary of Homeland Security";
            name = "Kristi Noem";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Kristi+Noem";
            biography = "Governor of South Dakota";
            previousExperience = "U.S. Representative, SD State Legislature";
            education = "South Dakota State University";
        },
        { 
            position = "Director of National Intelligence";
            name = "Tulsi Gabbard";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Tulsi+Gabbard";
            biography = "Former U.S. Representative from Hawaii";
            previousExperience = "U.S. Army National Guard, Hawaii House";
            education = "Hawaii Pacific University";
        },
        { 
            position = "National Security Advisor";
            name = "Mike Waltz";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Mike+Waltz";
            biography = "U.S. Representative and Green Beret veteran";
            previousExperience = "U.S. Army Special Forces, Pentagon Advisor";
            education = "Virginia Military Institute";
        },
        { 
            position = "CIA Director";
            name = "John Ratcliffe";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=John+Ratcliffe";
            biography = "Former Director of National Intelligence";
            previousExperience = "U.S. Representative, Federal Prosecutor";
            education = "University of Notre Dame Law School";
        },
        { 
            position = "White House Chief of Staff";
            name = "Susie Wiles";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Susie+Wiles";
            biography = "Senior Republican strategist";
            previousExperience = "Trump Campaign Senior Advisor";
            education = "University of Maryland";
        },
        { 
            position = "EPA Administrator";
            name = "Lee Zeldin";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Lee+Zeldin";
            biography = "Former U.S. Representative from New York";
            previousExperience = "U.S. Army Reserve, NY State Senate";
            education = "Albany Law School";
        },
        { 
            position = "Ambassador to the United Nations";
            name = "Elise Stefanik";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Elise+Stefanik";
            biography = "U.S. Representative from New York";
            previousExperience = "House Republican Conference Chair";
            education = "Harvard University";
        },
        { 
            position = "White House Counsel";
            name = "Bill McGinley";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Bill+McGinley";
            biography = "Former White House Cabinet Secretary";
            previousExperience = "White House Cabinet Secretary";
            education = "Catholic University Law School";
        },
        { 
            position = "Deputy Chief of Staff";
            name = "Stephen Miller";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Stephen+Miller";
            biography = "Former Senior Advisor to President Trump";
            previousExperience = "White House Senior Advisor";
            education = "Duke University";
        },
        { 
            position = "Border Czar";
            name = "Tom Homan";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Tom+Homan";
            biography = "Former Acting ICE Director";
            previousExperience = "ICE Acting Director, Border Patrol";
            education = "SUNY Canton";
        },
        { 
            position = "Ambassador to Israel";
            name = "Mike Huckabee";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Mike+Huckabee";
            biography = "Former Governor of Arkansas";
            previousExperience = "Governor of Arkansas, Fox News Host";
            education = "Ouachita Baptist University";
        },
        { 
            position = "Government Efficiency Advisor";
            name = "Elon Musk";
            imageUrl = "https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg";
            biography = "CEO of Tesla and SpaceX";
            previousExperience = "PayPal Co-founder, Tesla/SpaceX CEO";
            education = "University of Pennsylvania";
        },
        { 
            position = "Government Efficiency Advisor";
            name = "Vivek Ramaswamy";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Vivek+Ramaswamy";
            biography = "Entrepreneur and former presidential candidate";
            previousExperience = "Roivant Sciences Founder, CEO";
            education = "Harvard University, Yale Law School";
        },
        { 
            position = "Middle East Envoy";
            name = "Steve Witkoff";
            imageUrl = "https://placehold.co/400x500/1C2841/C5A572?text=Steve+Witkoff";
            biography = "Real estate developer and investor";
            previousExperience = "Witkoff Group Chairman & CEO";
            education = "Hofstra University Law School";
        }
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
