function configure() {
    const mainContent = document.getElementById('main-content');
    addImageHandler();

    if(iOS()) {
        wrapTables(mainContent);
    }

    // Get the difference between the content and the body height,
    // Usually the body height follows the view port so,
    // if the content is way smaller than the body height
    // we should calc the difference to pass flutter the correct value
    var diff = document.body.scrollHeight - mainContent.scrollHeight;
    return document.body.scrollHeight - diff;
}

function wrapTables(mainContent) {
    const tables = mainContent.getElementsByTagName('table');
    for(let table of tables) {
        const div = document.createElement('div');
        div.style.overflow = 'auto';
        table.parentNode.insertBefore(div, table);
        div.appendChild(table);
    }
}

function addImageHandler() {
    const images = document.querySelectorAll('img');
    for(let image of images) {
        if(image.parentNode.nodeName.toUpperCase() !== 'A') {
            image.onclick = function () {
                WebViewChannel.postMessage(JSON.stringify({
                    type: 'openImage',
                    source: image.src,
                    title: image.alt || image.src
                }));
            }
        }
    }
}

// Code extracted from the post: 
// https://stackoverflow.com/questions/9038625/detect-if-device-is-ios
function iOS() {
    return [
      'iPad Simulator',
      'iPhone Simulator',
      'iPod Simulator',
      'iPad',
      'iPhone',
      'iPod'
    ].includes(navigator.platform)
    // iPad on iOS 13 detection
    || (navigator.userAgent.includes("Mac") && "ontouchend" in document)
  }
