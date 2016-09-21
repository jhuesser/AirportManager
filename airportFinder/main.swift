//
//  main.swift
//  airportFinder
//
//  Created by Jonas Hüsser on 20.09.16.
//  Check LICENCE file in repo for the licence.
//

import Foundation
//need darwin for exit(0) command later
import Darwin

//setup a few airports in the directory. [key : value]
var airports: [String : String] = ["TOR": "Toronto", "NY": "New York", "LHR": "London Heathrow","ZRH": "Zurich Airport", "BER" : "This is a joke right?"]

//initalize some values
//do i really need this values?
var AirportCode: String
var Result: String

//function to check if airport given exists in directory airports
func airportExistsByCode(APC AirportCode: String) -> Bool {
    
    //looks up the AirportCode. bool value if it exists or not.
    let codeExists = airports[AirportCode] != nil
    
    //returns the bool
    return codeExists
}


//Search an airport by Code.
func searchAirportByCode(APC AirportCode: String) -> String {
    //check if the code given exists in directory
    let codeExists = airportExistsByCode(APC: AirportCode)
    
    //true
    if codeExists == true {
        //sets airport name to value of key
        AirportName = airports[AirportCode]!
    } else {
    //false
        //prints error message
        print("Sorry the Airport with Code \(AirportCode) could not be found")
        //somehow i need this, because AirportName has a value....
        AirportName = ""
    
    }
 
    //returns the value
    return AirportName
}


//the "UI" for the lookup
//Maybe i can migrate the function LookupUI and searchAirportByCode...
func LookupUI() {
    //Asks for the airport code (LHR for example)
    print("Please Enter the Airport you want to look up: ")
    //saves user input
    let AirportCode = readLine(strippingNewline: true)!
    //looks up the Airport and save the Name in Result
    let Result = searchAirportByCode(APC: AirportCode)
    
    //prints the Name
    print(Result)
    //go back to main function (doesn't need a restart of the application)
    main()
}

//add new airport
func addAirportByCode() {
    //asks for code of the airport
    print("Please enter the Code of the Airport:")
    //saves code
    let AirportCode = readLine(strippingNewline: true)!
    //asks for name of airport
    print("Please enter the Name / Description of the Airport with the Code \(AirportCode)")
    //saves name of airport
    let AirportName = readLine(strippingNewline: true)!
    //insert new key and value in the dict.
    airports[AirportCode] = AirportName
    //checks if new data is in the dict
    //does key exists?
    let codeExists = airportExistsByCode(APC: AirportCode)
    //yes
    if codeExists == true {
        //successfull
        print("Adding of airport with code \(AirportCode) and name \(AirportName) was successfull")
    } else {
    //no
        //error
        print("Sorry the airport could not be added")
        
    }
//go back to main function (doesn't need a restart of the application)
main()
    
}
//delete an airport by code given
func deleteAirportByCode() {
    //aks for code
    print("Please enter the code of the airport you want to delete:")
    //saves code
    let AirportCode = readLine(strippingNewline: true)!
    //does airport exists
    let codeExists = airportExistsByCode(APC: AirportCode)
    //yes
    if codeExists == true {
        //asks for airport name
        let AirportName = airports[AirportCode]!
        //Is user sure he wants delete the airport?
        print("Are you sure you want to delete the airport \(AirportName) with code \(AirportCode) ? [Y/N]")
        //saves reply
        let uac = readLine(strippingNewline: true)!
        //user is sure
        if uac == "y" {
            //delete entry
            airports.removeValue(forKey: AirportCode)
            //success
            print("Succesfully deleted \(AirportCode) \(AirportName)")
            
            
        } else if uac == "n" {
        //user is not sure
            //nothing deleted
            print("Airport \(AirportName) with code \(AirportCode) was not deleted")
           
        } else {
        //user can't read
            //nothing delted
            print("\(uac) is not a vailid option.")
            //ask again which airport
            deleteAirportByCode()
        }
        
    } else {
    //no
        //nothing delted
        print("Sorry the airport with code \(AirportCode) could not be found. Nothing deleted")
        
    }
    //go back to main function (doesn't need a restart of the application)
    main()
}

//main function (doesn't need a restart of the application)
func main(){

    //aks for option
    print("Please select an option [L]ookup Airport, [A]dd new airport, [D]elete airport, [q]uit")
    //saves option
    let option = readLine(strippingNewline: true)!
    //user wants to add airport?
    if option == "a" {
        //yes - he can
        addAirportByCode()
    //user wants to lookup airport?
    } else if option == "l" {
        //yes - he can
        LookupUI()
    //user wants to delete airport?
    } else if option == "d"{
        //yes - he can
        deleteAirportByCode()
    //user wants to quit?
    } else if option == "q"{
        //yes - he can
        exit(0)
    //user is stupid?
    } else {
        //yes - app restarts
        print("There is no such option \(option)")
        main()
    
    
    }
}

//Swift somhow wants this value initalized at this point
//TODO: do I even need this value?
var AirportName: String
//start with main function
main()


//THIS IS THE END, BEAUTIFUL FRIEND, THIS IS THE END, MY ONLY FRIEND, THE ENDs

