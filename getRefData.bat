@echo Before run this batch file, you need to connect the target org already!!

@echo off
REM Create a folder to store those reference data
md OutputReferenceData

set /p targetOrg= "Please select the org you want to link : " 

REM Get relationship types
set relType= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Allow_as_Primary__c, cloupra__Allow_From_Organisation__c, cloupra__Allow_From_Person__c, cloupra__Allow_From_Service__c, cloupra__Allow_From_Team_Member__c, cloupra__Allow_To_Organisation__c, cloupra__Allow_To_Person__c, cloupra__Allow_To_Service__c, cloupra__Allow_To_Team_Member__c, cloupra__Article__c, cloupra__Client_Role__c, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, cloupra__From_Party_Role__c, cloupra__Group_Code__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, cloupra__Locked__c, cloupra__Order__c, OwnerId, cloupra__Phrase__c, cloupra__Preposition__c, cloupra__Related_Category__c, Name, cloupra__Sharing_Scope__c, SystemModstamp, cloupra__Related_Category__r.cloupra__Code__c FROM cloupra__Relationship_Type__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/RelationshipTypes.csv

REM Get categories
set category= sfdx force:data:soql:query -q "SELECT Id, cloupra__Abbreviation__c, cloupra__Action_Code__c, cloupra__Active__c, cloupra__Allocation_Option__c, cloupra__Allow_As_Child_Entity__c, cloupra__Allow_Child_Services__c, cloupra__Background_Colour__c, cloupra__Border__c, Name, cloupra__Code__c, cloupra__Context__c, CreatedById, CreatedDate, cloupra__Deemed_Response_Period__c, IsDeleted, cloupra__Depends_On__c, cloupra__Estimated_Duration__c, cloupra__External_Number_Label__c, cloupra__Group__c, cloupra__Group_Code__c, cloupra__Icon_Name__c, cloupra__Include_By_Default__c, cloupra__Instalment_Billing__c, cloupra__Instalment_Option__c, cloupra__Insurance__c, cloupra__Interval_Months__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, cloupra__Locked__c, cloupra__Midwinter_Value__c, cloupra__Notice_Period__c, cloupra__Ongoing_Service_Package__c, cloupra__Order__c, cloupra__Order_String__c, cloupra__Override_Page__c, OwnerId, cloupra__Parent_Picklist_Value__c, cloupra__Percentage__c, cloupra__Related_Picklist_Value__c, cloupra__Related_To__c, cloupra__Renewal_Interval__c, cloupra__Renewals_Per_Year__c, cloupra__Renewals__c, cloupra__Review_Interval__c, cloupra__Role__c, cloupra__Sharing_Scope__c, cloupra__Statement_Interval__c, cloupra__Statements__c, cloupra__Superannuation__c, cloupra__Sync_To_Event__c, SystemModstamp, cloupra__Text_Colour__c, cloupra__Estimated__c, cloupra__Allocation_Option__r.cloupra__Code__c, cloupra__Depends_On__r.cloupra__Code__c, cloupra__Instalment_Option__r.cloupra__Code__c, cloupra__Role__r.cloupra__Code__c FROM cloupra__Category__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Categories.csv

REM Get process types
set pType= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Assignment_Type__c, cloupra__Background_Colour__c, cloupra__Border__c, cloupra__Code__c, CreatedById, CreatedDate, cloupra__Default_Duration__c, cloupra__Default_Frequency__c, IsDeleted, cloupra__Description__c, cloupra__Group__c, cloupra__Group_Code__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, cloupra__Launch_Page__c, cloupra__Locked__c, cloupra__Order__c, OwnerId, Name, cloupra__Regulation__c, cloupra__Related_To__c, cloupra__Relationship_Type__c, cloupra__Sharing_Scope__c, cloupra__Stage__c, SystemModstamp, cloupra__Task_Due_Date_Basis__c, cloupra__Text_Colour__c, cloupra__Regulation__r.cloupra__Code__c, cloupra__Relationship_Type__r.cloupra__Code__c, cloupra__Stage__r.cloupra__Code__c FROM cloupra__Process__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/ProcessTypes.csv

REM Get process steps
set pStep= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Assignment_Type__c, cloupra__Code__c, cloupra__Conga_Parameters__c, cloupra__Copy_Fields__c, CreatedById, CreatedDate, IsDeleted, cloupra__Description__c, cloupra__Due_Date__c, cloupra__Due_Date_Offset__c, cloupra__Estimated_Effort__c, cloupra__Estimated_Effort_Days__c, cloupra__Estimated_Effort_Hours__c, cloupra__Estimated_Effort_Minutes__c, cloupra__Group_Code__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, cloupra__Launch_Docusign__c, cloupra__Locked__c, cloupra__Order__c, cloupra__Outcome_Count__c, OwnerId, cloupra__Priority__c, cloupra__Process__c, Name, cloupra__Relationship_Type__c, cloupra__Sharing_Scope__c, cloupra__Stage__c, cloupra__Task_Subject__c, cloupra__Suppress_At_Launch__c, SystemModstamp, cloupra__Task_Group__c, cloupra__Team_Member__c, cloupra__User__c, cloupra__Assigned_To__c, cloupra__Due_Date_Interval__c, cloupra__Step__c, cloupra__Subject__c, cloupra__Priority__r.cloupra__Code__c, cloupra__Process__r.cloupra__Code__c, cloupra__Relationship_Type__r.cloupra__Code__c, cloupra__Stage__r.cloupra__Code__c, cloupra__Step__r.cloupra__Code__c, cloupra__Task_Group__r.cloupra__Code__c FROM cloupra__Process_Step__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/ProcessSteps.csv

REM Get outcomes
set outcome= sfdx force:data:soql:query -q "SELECT Id, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, LastModifiedById, LastModifiedDate, cloupra__Order__c, Name, OwnerId, cloupra__Process_Step__c, cloupra__Step_Outcome__c, SystemModstamp, cloupra__Step__c, cloupra__Process_Step__r.cloupra__Code__c, cloupra__Step_Outcome__r.cloupra__Code__c, cloupra__Step__r.cloupra__Code__c FROM cloupra__Step_Outcome__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Outcomes.csv

REM Get actions
set action= sfdx force:data:soql:query -q "SELECT Id, Name, cloupra__Action_Type__c, cloupra__Category__c, cloupra__Code__c, cloupra__Create_Process_Step__c, CreatedById, CreatedDate, IsDeleted, cloupra__From_Outcome__c, cloupra__From_Process_Step__c, LastModifiedById, LastModifiedDate, cloupra__Launch_Process__c, OwnerId, cloupra__Rollover_Service_Due_Date__c, cloupra__Service_Type__c, cloupra__Set_End_Date__c, cloupra__Set_Start_Date__c, SystemModstamp, cloupra__Unique_Action_Key__c, cloupra__Category__r.cloupra__Code__c, cloupra__Create_Process_Step__r.cloupra__Code__c, cloupra__From_Outcome__r.cloupra__Code__c, cloupra__From_Process_Step__r.cloupra__Code__c, cloupra__Launch_Process__r.cloupra__Code__c, cloupra__Service_Type__r.cloupra__Code__c FROM cloupra__Action__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Actions.csv

REM Get menu items
set MenuItem= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Add_Page__c, cloupra__Applies_To__c, cloupra__Apply_to_Contexts__c, cloupra__Class__c, cloupra__Code__c, cloupra__Conditional_Rendering__c, cloupra__Context__c, CreatedById, CreatedDate, cloupra__Default__c, IsDeleted, cloupra__Edit_Page__c, cloupra__Header_Page__c, cloupra__Icon__c, cloupra__Key__c, cloupra__Label__c, LastModifiedById, LastModifiedDate, Name, cloupra__Order__c, OwnerId, cloupra__Related_Menu_Item__c, cloupra__Scope__c, cloupra__Selector__c, cloupra__Sidebar__c, cloupra__Subtab__c, SystemModstamp, cloupra__Tab__c, cloupra__Target__c, cloupra__Trigger_State_Change__c, cloupra__Type__c, cloupra__Url__c, cloupra__View_Page__c, cloupra__Add_Page__r.skuid__UniqueId__c, cloupra__Edit_Page__r.skuid__UniqueId__c, cloupra__Header_Page__r.skuid__UniqueId__c, cloupra__Related_Menu_Item__r.cloupra__Code__c, cloupra__View_Page__r.skuid__UniqueId__c FROM cloupra__Menu_Item__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/MenuItems.csv

REM Get page_v1
set page_v1= sfdx force:data:soql:query -q "SELECT Id, skuid__Count_Auto_Saved_Versions__c, skuid__Composer_Settings__c, CreatedById, CreatedDate, IsDeleted, skuid__IsMaster__c, LastModifiedById, LastModifiedDate, skuid__Last_Modified_Date_Check__c, LastReferencedDate, LastViewedDate, skuid__Layout__c, skuid__Layout2__c, skuid__Layout3__c, skuid__Layout4__c, skuid__Layout5__c, skuid__MasterPage__c, skuid__Max_Auto_Saves__c, skuid__Module__c, OwnerId, Name, SystemModstamp, skuid__Type__c, skuid__UniqueId__c FROM skuid__Page__c WHERE skuid__Module__c IN ('cloupra','dynasty') ORDER BY Name ASC Limit 350" -u %targetOrg% -r csv ^> ./OutputReferenceData/Pages_v1.csv

REM Get page_v2
set page_v2= sfdx force:data:soql:query -q "SELECT Id, skuid__Count_Auto_Saved_Versions__c, skuid__Composer_Settings__c, CreatedById, CreatedDate, IsDeleted, skuid__IsMaster__c, LastModifiedById, LastModifiedDate, skuid__Last_Modified_Date_Check__c, LastReferencedDate, LastViewedDate, skuid__Layout__c, skuid__Layout2__c, skuid__Layout3__c, skuid__Layout4__c, skuid__Layout5__c, skuid__MasterPage__c, skuid__Max_Auto_Saves__c, skuid__Module__c, OwnerId, Name, SystemModstamp, skuid__Type__c, skuid__UniqueId__c FROM skuid__Page__c WHERE skuid__Module__c IN ('cloupra','dynasty') ORDER BY Name DESC Limit 350" -u %targetOrg% -r csv ^> ./OutputReferenceData/Pages_v2.csv

REM Get page assignment
set pAss= sfdx force:data:soql:query -q "SELECT Id, skuid__Action_Type__c, skuid__IsActive__c, skuid__Context__c, skuid__Assigned_To_User__c, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, skuid__Environment_Type__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, skuid__SObject_Type__c, OwnerId, Name, skuid__Page__c, skuid__RecordTypeDeveloperName__c, SystemModstamp, skuid__Use_Standard_Layouts__c, skuid__Page__r.skuid__UniqueId__c FROM skuid__Page_Assignment__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/PageAssignments.csv

REM Get lookup summary
set lSum= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__AggregateAllRows__c, cloupra__AggregateOperation__c, cloupra__AggregateResultField__c, cloupra__Async_Processing_Threshold__c, cloupra__CalculateJobId__c, cloupra__CalculationMode__c, cloupra__CalculationSharingMode__c, cloupra__ChildObject__c, cloupra__UniqueName__c, cloupra__ConcatenateDelimiter__c, CreatedById, CreatedDate, IsDeleted, cloupra__Description__c, cloupra__FieldToAggregate__c, cloupra__FieldToOrderBy__c, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, cloupra__Locked__c, Name, OwnerId, cloupra__ParentObject__c, cloupra__RelationshipCriteria__c, cloupra__RelationshipCriteriaFields__c, cloupra__RelationshipField__c, cloupra__RowLimit__c, SystemModstamp, cloupra__TestCode__c, cloupra__TestCodeSeeAllData__c FROM cloupra__LookupRollupSummary__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/LookupSummaries.csv

REM Get question
set question= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, cloupra__Details__c, LastModifiedById, LastModifiedDate, cloupra__Order__c, OwnerId, Name, cloupra__Related_Question__c, SystemModstamp, cloupra__Version__c, cloupra__Name__c, cloupra__Related_Question__r.cloupra__Code__c FROM cloupra__Question__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Questions.csv

REM Get answer
set answer= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, Name, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, LastModifiedById, LastModifiedDate, cloupra__Name__c, cloupra__Order__c, OwnerId, cloupra__Points__c, cloupra__Question__c, cloupra__Related_Answer__c, SystemModstamp, cloupra__Version__c, cloupra__Question__r.cloupra__Code__c, cloupra__Related_Answer__r.cloupra__Code__c FROM cloupra__Answer__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Answers.csv

REM Get risk band
set rBand= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, LastModifiedById, LastModifiedDate, cloupra__Lower_Bound__c, OwnerId, Name, SystemModstamp, cloupra__Upper_Bound__c FROM cloupra__Risk_Band__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/RiskBands.csv

REM Get tag
set tag= sfdx force:data:soql:query -q "SELECT Id, CreatedById, CreatedDate, IsDeleted, LastModifiedById, LastModifiedDate, Name, OwnerId, SystemModstamp, cloupra__Tagged_Records__c FROM cloupra__Tag__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Tags.csv

REM Get rule
set rule= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Code__c, CreatedById, CreatedDate, cloupra__Criteria__c, IsDeleted, cloupra__Description__c, LastModifiedById, LastModifiedDate, cloupra__Notify_on_Match__c, cloupra__Notify_on_Match_Template__c, cloupra__Notify_on_Unmatch__c, cloupra__Notify_on_Unmatch_Template__c, cloupra__Object__c, OwnerId, Name, SystemModstamp FROM cloupra__Rule__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/Rules.csv

REM Get snapshot definition
set sDef= sfdx force:data:soql:query -q "SELECT Id, cloupra__Active__c, cloupra__Code__c, CreatedById, CreatedDate, IsDeleted, cloupra__Frequency__c, LastModifiedById, LastModifiedDate, cloupra__Monthly_Recurrence__c, OwnerId, cloupra__Query__c, Name, SystemModstamp, cloupra__Target_Object__c, cloupra__Weekly_Recurrence__c FROM cloupra__Snapshot_Definition__c" -u %targetOrg% -r csv ^> ./OutputReferenceData/SnapshotDefinitions.csv

cmd.exe /c %relType%
cmd.exe /c %category%
cmd.exe /c %pType%
cmd.exe /c %pStep%
cmd.exe /c %outcome%
cmd.exe /c %action%
cmd.exe /c %MenuItem%
cmd.exe /c %page_v1%
cmd.exe /c %page_v2%
cmd.exe /c %pAss%
cmd.exe /c %lSum%
cmd.exe /c %question%
cmd.exe /c %answer%
cmd.exe /c %rBand%
cmd.exe /c %tag%
cmd.exe /c %rule%
cmd.exe /c %sDef%