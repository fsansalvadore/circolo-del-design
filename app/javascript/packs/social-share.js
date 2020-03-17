const SocialShare = () => {
  document.addEventListener('DOMContentLoaded', () => {
    const current_url = window.location.href;
    const currentPage_title = document.title;

    const fb = document.getElementById('facebook');
    const tw = document.getElementById('twitter');
    const wa = document.getElementById('whatsapp');
    const cb = document.getElementById('clipboard');

    fb.addEventListener('click', (e) => {
      e.preventDefault();
      const fb_shareUrl = "https://www.facebook.com/sharer/sharer.php?u=" + current_url;
      const window_size = "width=565,height=569";
      window.open(fb_shareUrl, "", "menubar_no,resizeable=yes,scrollbar=yes," + window_size);
      return false;
    })

    tw.addEventListener('click', (e) => {
      e.preventDefault();
      const tw_shareUrl = "https://twitter.com/intent/tweet?text=" + currentPage_title + "&url=" + current_url;
      const window_size = "width=565,height=569";
      window.open(tw_shareUrl, "", "menubar_no,resizeable=yes,scrollbar=yes," + window_size);
      return false;
    })

    wa.addEventListener('click', (e) => {
      e.preventDefault();
      const wa_shareUrl = "whatsapp://send?text=" + current_url;
      const window_size = "width=565,height=569";
      window.open(wa_shareUrl, "", "menubar_no,resizeable=yes,scrollbar=yes," + window_size);
      return false;
    })

    const copyToClipboard = str => {
      const el = document.createElement('textarea');
      el.value = str;
      el.setAttribute('readonly', '');
      el.style.position = 'absolute';
      el.style.left = '-9999px';
      document.body.appendChild(el);
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
    };

    cb.addEventListener('click', (e) => {
      copyToClipboard(current_url);
      e.preventDefault();
      alert("L'indirizzo URL è stato copiato negli appunti.");
    })
  });
}

export { SocialShare };
