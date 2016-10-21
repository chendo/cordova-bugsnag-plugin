'use strict';

var exec = require('cordova/exec');
var BugsnagBridge = (function () {
  var bridge = {};

  function defaultSuccess() {

  }

  function defaultError(err) {
    console.error("Bugsnag Plugin Error", err);
  }

  bridge.setUser = function (userId, name, email, success, error) {
    if (!success) {
      success = defaultSuccess;
    }

    if (!error) {
      error = defaultError;
    }

    exec(success, error, 'BugsnagBridge', 'setUser', [userId, name, email]);
  }

  bridge.addAttribute = function (attr, value, tabName, success, error) {
    if (!success) {
      success = defaultSuccess;
    }

    if (!error) {
      error = defaultError;
    }

    exec(success, error, 'BugsnagBridge', 'addAttribute', [attr, value, tabName]);
  }

  bridge.testReporting = function() {
    exec(defaultSuccess, defaultError, 'BugsnagBridge', 'testReporting', []);
  }

  return bridge;
})()

module.exports = BugsnagBridge;
