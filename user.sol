contract users{
    
    struct userDetails{
        bool privateAccount;    //if true, do not show details
        string name;
        string country;
    }
    
    mapping (address => userDetails) userDetailMap;  // user address to details mapping, optional to add

    /* modifiers*/
    modifier userVisible(address add){
        require( userDetailMap[add].privateAccount == false);
        _;
    }

    /* functions */

    function setMyDetails(bool privateAccount, string name, string country) public returns(bool){
        var udetails = userDetailMap[msg.sender];
        udetails.privateAccount = privateAccount;
        udetails.name = name; 
        udetails.country = country;
        return true;
    }
    
    function getUserDetails(address userAddress) view public userVisible(msg.sender) returns(string name, string country){
        return (userDetailMap[userAddress].name , userDetailMap[userAddress].country);
    }
    
}
