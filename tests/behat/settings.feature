@auth @auth_saml2 @javascript
Feature: SAML2 settings
  In order to configure the plugin
  As an administrator
  I need to change the settings in Moodle

  Background:
    Given the authentication plugin "saml2" is enabled                                  # auth_saml2
    And the following config values are set as admin:
      | idpmetadata | http://localhost:8001/saml2/idp/metadata.php | auth_saml2 |

  Scenario: I can navigate to the settings page
    Given I am an administrator                                                         # auth_saml2
    When I navigate to "SAML2" node in "Site administration > Plugins > Authentication"
    Then I should see "SAML2"
    And I should see "Authenticate with a SAML2 IdP"

  Scenario Outline: I can change the Dual Login options
    Given I am an administrator                             # auth_saml2
    And I am on the saml2 settings page                     # auth_saml2
    When I change the setting "Dual login" to "<Option>"    # auth_saml2
    And I press "Save changes"
    Then I go to the saml2 settings page again              # auth_saml2
    And the setting "Dual login" should be "<Option>"       # auth_saml2
    Examples:
      | Option       |
      | No           |
      | Yes          |
      | Passive mode |
