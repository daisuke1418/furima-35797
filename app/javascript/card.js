const pay = () => {
  Payjp.setPublicKey("pk_test_98a6042d954608726948a071");
  const form = document.getElementById("card-number");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("card-number");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
  });
};

window.addEventListener("load", pay);