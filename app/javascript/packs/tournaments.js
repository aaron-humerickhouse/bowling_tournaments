$(document).ready(function() {
  const params = new URLSearchParams(window.location.search);

  const zip_code = params.get("zip_code");
  const miles = params.get("miles");
  const months = params.get("months");

  if (zip_code !== "") {
    $('#search-form #zip_code').val(zip_code)
  }
  if (miles !== "") {
    $('#search-form #miles').val(miles)
  }
  if (months !== "") {
    $('#search-form #months').val(months)
  }

  clearSearch = () => {
    $('#search-form #zip_code').val('')
    $('#search-form #miles').val('')
    $('#search-form #months').val('')
    window.location.href = '/tournaments';
  }

  submitSearch = () => {
    const zip_code = $('#search-form #zip_code').val();
    const miles = $('#search-form #miles').val() || '';

    if ((zip_code !== "" && miles === "") || (zip_code === "" && miles !== "")) {
      $('#notice').text('Zip Code and radius are required together');
    } else {
      const months = $('#search-form #months').val() || 12;

      window.location.replace = `/tournaments?zip_code=${zip_code}&miles=${miles}&months=${months}`;
    }
  }
})
