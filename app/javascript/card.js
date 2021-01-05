const pay = () => {
  Payjp.setPublicKey("pk_test_");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_shipping[number]"),
      cvc: formData.get("buy_shipping[cvc]"),
      exp_month: formData.get("buy_shipping[exp_month]"),
      exp_year: `20${formData.get("buy_shipping[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("buy_shipping_number").removeAttribute("name")
      document.getElementById("buy_shipping_cvc").removeAttribute("cvc")
      document.getElementById("buy_shipping_exp_month").removeAttribute("name")
      document.getElementById("buy_shipping_exp_year").removeAttribute("name")
    });
  });
};

window.addEventListener("load", pay);