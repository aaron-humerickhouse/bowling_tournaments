import tempusDominus from '@eonasdan/tempus-dominus'

$(document).ready(function() {
  $('#tournament_alley_id').selectpicker();

  new tempusDominus.TempusDominus(document.getElementById('datetimepicker4'), {
    display: {
      viewMode: 'clock',
      components: {
        decades: true,
        year: true,
        month: true,
        date: true,
        hours: false,
        minutes: false,
        seconds: false,
      }
    }
  });

  new tempusDominus.TempusDominus(document.getElementById('datetimepicker3'), {
    display: {
      viewMode: 'clock',
      components: {
        decades: false,
        year: false,
        month: false,
        date: false,
        hours: true,
        minutes: true,
        seconds: false
      }
    }
  });

});


