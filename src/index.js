import Reveal from "reveal.js";
import RevealMarkdown from "reveal.js/plugin/markdown/markdown.esm.js";
import RevealMath from "reveal.js/plugin/math/math.esm.js";
import "reveal.js/dist/reveal.css";
import "reveal.js/dist/theme/night.css";

let deck = new Reveal({
  plugins: [RevealMarkdown, RevealMath.KaTeX],
});
deck.initialize();
