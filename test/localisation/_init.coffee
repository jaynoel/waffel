Waffel  = require '../../src/index'
Promise = require 'bluebird'
path    = require 'path'
fs      = require 'fs-extra'

config_localised = global.config_localised =
  silent:             true
  languages:          global.languages
  defaultLanguage:    global.languages[0]
  root:               path.join __dirname, '..', 'fixtures'
  dataFolder:         'data_localised'
  viewFolder:         'views'
  staticFolder:       'assets'
  localesFolder:      'locales'
  destinationFolder:  '../output/public_localised'
  structureFile:      'site_default.yml'

wfl_localised = global.wfl_localised = new Waffel global.config_localised

before (done) ->
  fs.removeSync path.join config_localised.root, config_localised.destinationFolder
  wfl_localised.on 'generation:complete', done
  wfl_localised.init().then ->
    wfl_localised.generate()
