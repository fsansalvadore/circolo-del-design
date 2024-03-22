const FacesFadeIn = () => {
  const faces = document.querySelectorAll(".faces-container");
  let delay = 0;
  faces.forEach((face) => {
    setTimeout(() => {
      face.classList.add("face-in");
      count++;
    }, delay);
    delay = delay + 100;
  });
};

export { FacesFadeIn };
