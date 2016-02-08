(function() {
  // Define filter operations
  window.shared || (window.shared = {});
  window.shared.MixpanelUtils = {
    registerUser: function(currentEducator) {
      if (!window.mixpanel) return;
      try {
        window.mixpanel.register({
          'educator_id': currentEducator.id,
          'educator_is_admin': currentEducator.admin,
          'educator_school_id': currentEducator.school_id
        });
      }
      catch (e) {
        console.error(e);
      }
    },
    track: function(key, attrs) {
      if (!window.mixpanel) return;
      try {
        return window.mixpanel.track(key, attrs);
      }
      catch (e) {
        console.error(e);
      }
    }
  };
})();