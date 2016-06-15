(function() {
  // Define filter operations
  window.shared || (window.shared = {});
  var Env = window.shared.Env;

  window.shared.MixpanelUtils = {
    isMixpanelEnabled: function() {
      return (window.mixpanel && Env.shouldReportAnalytics);
    },
    registerUser: function(currentEducator) {
      if (!Mixpanel.isMixpanelEnabled()) return;

      try {
        window.mixpanel.register({
          'deployment_key': Env.deploymentKey,
          'educator_id': currentEducator.id,
          'educator_is_admin': currentEducator.admin,
          'educator_school_id': currentEducator.school_id
        });
      }
      catch (err) {
        console.error(err);
      }
    },
    track: function(key, attrs) {
      if (!Mixpanel.isMixpanelEnabled()) return;
      try {
        return window.mixpanel.track(key, attrs);
      }
      catch (err) {
        console.error(err);
      }
    }
  };
})();