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

  submitSearch = () => {
    const zip_code = $('#search-form #zip_code').val();
    console.log(zip_code)
    if (zip_code === "") {
      $('#notice').text('Zip Code is required');
      return
    }
    const miles = $('#search-form #miles').val();
    const months = $('#search-form #months').val();

    window.location.href = `/tournaments?zip_code=${zip_code}&miles=${miles}&months=${months}`;
  }
})
