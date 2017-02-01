/********* cordova-add-contact.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "cordova-add-contact.h"

@implementation CordovaAddContact

- (void)addContact:(CDVInvokedUrlCommand*)command
{
    CNMutableContact *contact = [[CNMutableContact alloc] init];

    NSDictionary* options = command.arguments.count == 0 ? [NSNull null] : [command.arguments objectAtIndex:0];

    if ([options isKindOfClass:[NSNull class]]) {
        options = [NSDictionary dictionary];
    }

    CNLabeledValue *homeEmail = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:options[@"email"]];
    CNLabeledValue *homePhone = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:[CNPhoneNumber phoneNumberWithStringValue:options[@"phone"]]];

    contact.givenName = options[@"name"];
    contact.emailAddresses = @[homeEmail];
    contact.phoneNumbers = @[homePhone];

    _addContactVC = [CNContactViewController viewControllerForNewContact:contact];
    _addContactVC.delegate = self;
    _addContactVC.allowsEditing = YES;
    _addContactVC.allowsActions = YES;

    _navController = [[UINavigationController alloc] initWithRootViewController:_addContactVC];

    // Display the view
    [self.viewController presentViewController:_navController animated:YES completion:^{}];

}

-(void)contactViewController:(CNContactViewController *)viewController didCompleteWithContact:(CNContact *)contact {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}



@end
