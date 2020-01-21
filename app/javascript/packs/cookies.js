const cookies = () => {

 window.addEventListener("load", function(){
  window.cookieconsent.initialise({
    "palette": {
      "popup": {
        "background": "#ffed00",
        "text": "#000000"
      },
      "button": {
        "background": "#000000",
        "text": "#ffffff"
      }
    },
    "content": {
      "message": "Questo sito fa uso di cookie per migliorare l’esperienza di navigazione degli utenti e per raccogliere informazioni sull’utilizzo del sito stesso. Proseguendo nella navigazione si accetta l’uso dei cookie.",
      "dismiss": "Confermo",
      "link": "Scopri di più",
      "href": "privacy-cookie-policy.html"
    }
  })});
}

export { cookies };
