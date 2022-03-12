require "serialize"

local logging = {}

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

logging.levels = {
  VERBOSE = VERBOSE,
  DEBUG = DEBUG,
  INFO = INFO,
  WARN = WARN,
  ERROR = ERROR,
}

local currentLogLevel = DEFAULT

function logging.setLevel(level)
  currentLogLevel = level
end

function logging.log(level, message)
  if level >= currentLogLevel then
    print('[' .. _("MOD_NAME") ..'][' .. os.date('%Y-%m-%d %H:%M:%S') .. '][' .. levelNames[level] .. '] ' .. toString(message))
  end
end

function logging.verbose(message)
  logging.log(VERBOSE, message)
end

function logging.debug(message)
  logging.log(DEBUG, message)
end

function logging.info(message)
  logging.log(INFO, message)
end

function logging.warn(message)
  logging.log(WARN, message)
end

function logging.error(message)
  logging.log(ERROR, message)
end

return logging
