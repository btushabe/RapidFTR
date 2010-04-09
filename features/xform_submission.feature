Feature: As a mobile user
  I want to submit information in xform format
  So that I can use a generic xform mobile client in the field

Scenario: Uploading valid form redirects to child record
    When I submit the following xform
      """
      <xform>
        <name>Jenny</name>
        <age>12</age>
        <age_is>Approximate</age>
        <last_known_location>Cairo</last_known_location>
      </xform>
      """
    Then I should have received a "201 Created" status code
    And I should be redirected to the full url for child with name "Jenny"

@wip
Scenario: Credentials passed in during upload are used to record which user uploaded the record

Scenario: Uploading valid form creates child record
    When I submit the following xform
      """
      <xform>
        <name>Jenny</name>
        <age>12</age>
        <age_is>Approximate</age>
        <last_known_location>Cairo</last_known_location>
      </xform>
      """
    And I am logged in
    And I go to the saved record page for child with name "Jenny"
    Then I should see "Name: Jenny"
    And I should see "Age: 12"
    And I should see "Age is: Approximate"
