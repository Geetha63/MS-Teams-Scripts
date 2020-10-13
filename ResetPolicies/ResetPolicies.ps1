$credential= get-credential
Import-Module SkypeOnlineConnector 
$sfboSession = New-CsOnlineSession -Credential  $credential
Import-PSSession $sfboSession -AllowClobber

#teams policies
Set-CsTeamsChannelsPolicy -Identity global -AllowPrivateChannelCreation $false
New-CsTeamsChannelsPolicy -Identity AllTeachers -AllowPrivateChannelCreation $true

#Meetings Policies
Set-CsTeamsMeetingPolicy -Identity global -AllowMeetNow $false -AllowOutlookAddIn $false -AllowChannelMeetingScheduling $false -AllowPrivateMeetingScheduling $false -AllowTranscription $true -AllowCloudRecording $false  -AllowParticipantGiveRequestControl $false -AllowExternalParticipantGiveRequestControl $false -AllowPowerPointSharing $true -AllowWhiteboard $true -AllowSharedNotes $true -AllowAnonymousUsersToStartMeeting $false -AutoAdmittedUsers OrganizerOnly -LiveCaptionsEnabledType DisabledUserOverride -MeetingChatEnabledType enabled -AllowPrivateMeetNow $false


New-CsTeamsMeetingPolicy -Identity AllTeachers -AllowMeetNow $true -AllowOutlookAddIn $true -AllowChannelMeetingScheduling $true -AllowPrivateMeetingScheduling $true -AllowTranscription $true -AllowCloudRecording $false -AllowParticipantGiveRequestControl $true -AllowExternalParticipantGiveRequestControl $true -AllowPowerPointSharing $true -AllowWhiteboard $true -AllowSharedNotes $true -AllowAnonymousUsersToStartMeeting $false -AutoAdmittedUsers EveryoneInCompany -LiveCaptionsEnabledType DisabledUserOverride -MeetingChatEnabledType enabled -AllowPrivateMeetNow $true


#meeting Settings
set-CsTeamsMeetingConfiguration -DisableAnonymousJoin $true

#messaging policies
Set-CsTeamsMessagingPolicy -Identity global -AllowUserDeleteMessage $false -AllowUserEditMessage $false -ReadReceiptsEnabledType Everyone -AllowUserChat $false -AllowMemes $false -AllowPriorityMessages $false -AudioMessageEnabledType disabled -AllowRemoveUser $false -AllowSmartReply $false -ChannelsInChatListEnabledType EnabledUserOverride -AllowGiphy $false -AllowGiphyDisplay $false

new-CsTeamsMessagingPolicy -Identity AllTeachers -AllowUserDeleteMessage $true -AllowUserEditMessage $true -ReadReceiptsEnabledType Everyone -AllowUserChat $true -AllowMemes $false -AllowPriorityMessages $true -AudioMessageEnabledType ChatsAndChannels -AllowRemoveUser $true -AllowSmartReply $true -ChannelsInChatListEnabledType EnabledUserOverride -AllowGiphy $false -AllowGiphyDisplay $false -AllowOwnerDeleteMessage $true


#Assignment policy
Set-CsTeamsEducationAssignmentsAppPolicy -MakeCodeEnabledType disabled -TurnItInEnabledType enabled

#OrgWide settings
Set-CsTeamsClientConfiguration -AllowEmailIntoChannel $false -AllowDropBox $false -AllowBox $false -AllowGoogleDrive $false -AllowShareFile $false -AllowGuestUser $false -AllowEgnyte $false -AllowOrganizationTab $false -AllowScopedPeopleSearchandAccess $true

#apps
Set-CsTeamsAppPermissionPolicy -GlobalCatalogAppsType  AllowedAppList