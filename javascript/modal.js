//create the instances
var overlayElement = null;
var modalWindowElement = null;
var startwidth = null;
var maxheight= null;

//detect touch and then automatically assign events
var isTouchSupported = 'ontouchstart' in window.document;
var startEvent = isTouchSupported ? 'touchstart' : 'mousedown';
var moveEvent = isTouchSupported ? 'touchmove' : 'mousemove';
var endEvent = isTouchSupported ? 'touchend' : 'mouseup';

startwidth = window.innerWidth;


//when window loads
function about() {
    
    showPopUpMessage(createPopUpContent("Tube data provided by TFL</p><p>Some elements of this site are based on CSS provided by iWebKit</p>"), 250, 95);
    
}
//when window is resized
window.addEventListener("resize",handleResize,false); //resizing is useful only when popups are opened
    //re-position the modal pop up to the center of the page
    function handleResize()
    {               
        if(modalWindowElement)
        {
            startwidth = window.innerWidth;
            modalWindowElement.style.left = (window.innerWidth - modalWindowElement.offsetWidth) / 2 + "px";
            modalWindowElement.style.top = (window.innerHeight - modalWindowElement.offsetHeight) / 2 + "px";      
        }
    }            
            
    /* Common header for Pop Ups */
    function createPopUpHeader(title)
    {
        //return the header after creating
    
        //create header for modal window area
        modalWindowHeader = document.createElement("div");
        modalWindowHeader.className = "modalWindowHeader";
        modalWindowHeader.innerHTML = "<p>" + title + "</p>";
    
        return modalWindowHeader;
    }
    function createPopUpContent(msg)
    {
        //return the content after creating
    
        //create modal window content area
        modalWindowContent = document.createElement("div");
        modalWindowContent.className = "modalWindowContent";
    
        modalWindowContent.innerHTML = "<p style='text-align:center; margin-top:10px;'>" + msg + "</p>";
        //create the place order button
        
        return modalWindowContent;
    }

    //show the modal overlay and popup window
    function showPopUpMessage(modalWindowContent,width,height) {
        overlayElement = document.createElement("div");
        overlayElement.className = 'modalOverlay';
        modalWindowElement = document.createElement("div");
        modalWindowElement.className = 'modalWindow';
                
        //position modal window element
        modalWindowElement.style.width = width + "px";
        modalWindowElement.style.height = height + "px";
        modalWindowElement.style.left = (startwidth - width) / 2 + "px";
        modalWindowElement.style.top = (window.innerHeight - height) / 2 + "px";
        //add childs
        //modalWindowElement.appendChild(modalWindowHeader);
        modalWindowElement.appendChild(modalWindowContent);
        document.body.appendChild(overlayElement);
        document.body.appendChild(modalWindowElement);
        setTimeout(function () {
            modalWindowElement.style.opacity = 1;
            overlayElement.style.opacity = 0.4;
            overlayElement.addEventListener("click", hidePopUpMessage, false);
            modalWindowElement.addEventListener("click", hidePopUpMessage, false);
        }, 300);
    }
    //hide the modal overlay and popup window
    function hidePopUpMessage() {
        modalWindowElement.style.opacity = 0;
        overlayElement.style.opacity = 0;
        overlayElement.removeEventListener(endEvent, hidePopUpMessage, false);
        setTimeout(function() {
            document.body.removeChild(overlayElement);
            document.body.removeChild(modalWindowElement);
        }, 400);         
    }