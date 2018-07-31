//
//  main.m
//  WordEffects
//
//  Created by Nathan Wainwright on 2018-07-30.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (true) {
            
            int userChoice = 0;
            char userStringChoice[255];
            NSMutableString *canadaString = [[NSMutableString alloc] initWithString:@""];
            
            printf("Input your choice (number): ");
            fgets(userStringChoice, 255, stdin);
            
            userChoice = atoi(userStringChoice); // converts userInput string, into a usable integer HAS NO ERROR CHECKING
            
            NSLog(@"User Inputting: %d",userChoice);
            
            // 255 unit long array of characters
            char inputChars[255];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            inputChars[strlen(inputChars)-1] = '\0';
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            
            // print NSString object
            //NSLog(@"Input was: %@", inputString);
            
            // print out memory address used
            //NSLog(@"Memory Address was: %p", &inputString);
            

            
            
            
            switch (userChoice) {
                case 1:
                    // UPPER CASE
                    NSLog(@"UPPERCASED: %@", [inputString uppercaseString]);
                    break;
                
                case 2:
                    // LOWER CASE
                    NSLog(@"lowercased: %@", [inputString lowercaseString]);
                    break;
                    
                case 3:
                    // Numberize
                    {
                        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"]; // make a set of chars
                        
                        set = [set invertedSet]; // now invert that set to have anything BUT numbers
                        
                        NSRange range = [inputString rangeOfCharacterFromSet:set]; // take character set, then search said input for any matching chars
                        
                        
                    
                        if (range.location != NSNotFound) // if any chars match anything from INVERTED set, then "true", so hence "non numeric chars"
                        {
                            NSLog(@"String contains other non-numeric characters");
                        }
                        else
                        {
                            NSLog(@"Numberize: %d", [inputString intValue]);
                        }
                    }
                    break;
               
                case 4:
                    // Canadianize
                    [canadaString appendFormat:@"%@, eh?", inputString];
                    NSLog(@"Canadian: %@", canadaString);
                    break;
                    
                case 5:
                    {
                        char lastCharacter = inputChars[strlen(inputChars)-1];
                        
              
                        // Respond
                        if (lastCharacter == '?')
                        {
                            NSLog(@"I don't know");
                        }
                        else if (lastCharacter == '!')
                        {
                            NSLog(@"Whoa, calm down!");
                        }
                    }
                    break;
                    
                case 6:
                    // De-Space-It
                    NSLog (@"De-Space-It: %@", [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
                case 7:
                    //letter count
                    NSLog(@"Letter count: %lu", [inputString length]);
                    break;
                case 8:
                    //Punctuation removal
                    {
                    //For puntuation removal method
                    // Create character set with specified characters
                    NSMutableCharacterSet *characterSet =
                    [NSMutableCharacterSet characterSetWithCharactersInString:@"!@#$%^&*+=|,.()-"];
                    // Build array of components using specified characters as separtors
                    NSArray *arrayOfComponents = [inputString componentsSeparatedByCharactersInSet:characterSet];
                    
                    // Create string from the array components
                    NSString *filterOutput = [arrayOfComponents componentsJoinedByString:@""];
                    NSLog(@"Punctuation removal : %@", filterOutput);
                    }
                    
                    
                default:
                    break;
            }

        
        
        } // end while
    }
    return 0;
}
