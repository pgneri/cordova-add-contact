/********* cordova-add-contact.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "cordova-add-contact.h"

@implementation CordovaAddContact

- (void)addContact:(CDVInvokedUrlCommand*)command
{
        CNContact *contact = [[CNContact alloc] init];

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
