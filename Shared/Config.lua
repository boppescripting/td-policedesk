TDPD = {}
TDPD.Config = {}

-- WHERE THE REQUEST POPUP IS LOCATED.
-- DEFAULT: vector3(441.73, -982.03, 30.73)
TDPD.Config.Coords = vector3(441.73, -982.03, 30.73)

-- THE NOTIFICATION MESSAGE SENT TO PLAYER WHEN EMAIL IS SENT TO ON DUTY POLICE.
-- DEFAULT: 'On duty officers have been notified of your assistance request.'
TDPD.Config.SuccessMessage = 'On duty officers have been notified of your assistance request.'

-- THE NOTIFICATION MESSAGE SENT TO PLAYER WHEN THERE IS NO ON DUTY POLICE.
-- DEFAULT: 'There are no on duty police officers at this time.'
TDPD.Config.FailureMessage = 'There are no on duty police officers at this time.'

-- THE TEXT DISPLAYED AT THE POLICE DESK.
-- DEFAULT: '[~g~E~w~] Request Officer'
TDPD.Config.3dText = '[~g~E~w~] Request Officer'

-- JOB NAMES FOR POLICE. DOES ACCEPT MULTIPLE JOBS (lspd, bcso, etc.).
-- DEFAULT: { 'police' }
TDPD.Config.PoliceJobs = {
    'police'
}