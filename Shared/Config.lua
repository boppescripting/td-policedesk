TDPD = {}
TDPD.Config = {}

-- WHERE THE REQUEST POPUP IS LOCATED.
-- DEFAULT: {name='MRPD', coords=vector3(441.73, -982.03, 30.73)}
TDPD.Config.Locations = {
    {name='MRPD', coords=vector3(441.73, -982.03, 30.73)}
}

-- COOLDOWN PERIOD TO REQUEST ASSISTANCE AGAIN; THIS IS IN SECONDS.
TDPD.Config.RequestCooldown = 10

-- WHAT THE POPUP TEXT CHANGES TO DURING THE COOLDOWN.
TDPD.Config.PleaseWait = 'Assistance has been requested.'

-- THE NOTIFICATION MESSAGE SENT TO PLAYER WHEN EMAIL IS SENT TO ON DUTY POLICE.
-- DEFAULT: 'On duty officers have been notified of your assistance request.'
TDPD.Config.SuccessMessage = 'On duty officers have been notified of your assistance request.'

-- THE NOTIFICATION MESSAGE SENT TO PLAYER WHEN THERE IS NO ON DUTY POLICE.
-- DEFAULT: 'There are no on duty police officers at this time.'
TDPD.Config.FailureMessage = 'There are no on duty police officers at this time.'

-- THE TEXT DISPLAYED AT THE POLICE DESK.
-- DEFAULT: '[~g~E~w~] Request Officer'
TDPD.Config.PopupText = '[~g~E~w~] Request Officer'

-- THE EMAIL SENDER FOR THE POLICE EMAIL.
-- DEFAULT: 'Police Dispatcher'
TDPD.Config.EmailSender = 'Police Dispatcher'

-- THE EMAIL SUBJECT FOR THE POLICE EMAIL.
-- DEFAULT: 'Assistance Required'
TDPD.Config.EmailSubject = 'Assistance Required'

-- THE EMAIL MESSAGE FOR THE POLICE EMAIL.
-- DEFAULT: 'Officer,<br/>There is an individual at the police department desk requesting the assistance of a present officer.'
TDPD.Config.EmailMessage = 'Officer,<br/>There is an individual requesting the assistance of a present officer at '

-- JOB NAMES FOR POLICE. DOES ACCEPT MULTIPLE JOBS (lspd, bcso, etc.).
-- DEFAULT: { 'police' }
TDPD.Config.PoliceJobs = {
    'police'
}