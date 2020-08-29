---
title: "Support CSS Variables in Old Browsers Using SCSS"
date: 2020-04-19T17:25:48+04:00
publishdate: 2020-04-19T17:25:48+04:00
---

```scss
$red: crimson;

:root {
    --red: $red;    
}

.my-awesome-paragraph {
    color: $red; // Fallback to support old browsers when needed
    color: var(--red);
}
```

You can try to compile this and see the result on {{<a href="https://www.sassmeister.com/" target="_blank" rel="noopener noreferrer">}}SassMeister playground{{</a>}} or download a simple {{<a href="https://github.com/oorkan/scss-to-css" target="_blank" rel="noopener noreferrer">}}SCSS to CSS{{</a>}} converter and use with npm.

