require "serialize"

local LOG = {}

local VERBOSE = 10
local DEBUG = 20
local INFO = 30
local WARN = 40
local ERROR = 50

local DEFAULT = INFO

local levelNames = {
	[VERBOSE] = 'VERBOSE',
	[DEBUG] = 'DEBUG',
	[INFO] = 'INFO',
	[WARN] = 'WARN',
	[ERROR] = 'ERROR',
}

LOG.levels = {
	VERBOSE = VERBOSE,
	DEBUG = DEBUG,
	INFO = INFO,
	WARN = WARN,
	ERROR = ERROR,
}

local currentLogLevel = DEFAULT

function LOG.setLevel(level)
	currentLogLevel = level
end

function LOG.log(level, message, args)
	if level >= currentLogLevel then
		local strMessage = ""
		if #args > 0 then
			local strArgs = {}
			for index, value in ipairs(args) do
				strArgs[index] = toString(value)
			end
			strMessage = string.format(message, table.unpack(strArgs))
		else
			strMessage = toString(message)
		end

		print('[' .. _("MOD_NAME") ..'][' .. os.date('%Y-%m-%d %H:%M:%S') .. '][' .. levelNames[level] .. '] ', strMessage)
	end
end

function LOG.verbose(message, ...)
	LOG.log(VERBOSE, message, {...})
end

function LOG.debug(message, ...)
	LOG.log(DEBUG, message, {...})
end

function LOG.info(message, ...)
	LOG.log(INFO, message, {...})
end

function LOG.warn(message, ...)
	LOG.log(WARN, message, {...})
end

function LOG.error(message, ...)
	LOG.log(ERROR, message, {...})
end

return LOG
