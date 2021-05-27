const fs = require("fs");
const path = require("path");

const placeholderName = "AddonTemplate";
const addonName = path.basename(__dirname);

const files = fs.readdirSync("./");

files.forEach((fileName) => {
  const stats = fs.statSync(fileName);

  if (stats.isFile()) {
    const fileContent = fs.readFileSync(fileName, "utf-8");
    const newContent = fileContent.split(placeholderName).join(addonName);

    fs.writeFileSync(fileName, newContent);

    if (fileName.includes(placeholderName)) {
      const newFileName = fileName.replace(placeholderName, addonName);
      fs.renameSync(fileName, newFileName);
    }
  }
});

fs.unlinkSync("./Init.js");
