document.addEventListener("DOMContentLoaded", function () {
  var sidebar = document.getElementById("sidebar");
  var content = document.getElementById("content");
  var menuButton = document.getElementById("menuDiv");

  menuButton.addEventListener("click", function (event) {
    // Toggle sidebar visibility
    var isSidebarVisible = sidebar.style.left === "0px";
    sidebar.style.left = isSidebarVisible ? "-250px" : "0";
    content.style.marginLeft = isSidebarVisible ? "0" : "250px"; // Adjust content margin accordingly
    event.stopPropagation(); // Prevent the click event from reaching the content area
  });

  // Close sidebar when clicking outside of it or on the content area
  document.addEventListener("click", function (event) {
    if (
      sidebar.style.left === "0px" &&
      event.target !== sidebar &&
      event.target !== menuButton
    ) {
      sidebar.style.left = "-250px";
      content.style.marginLeft = "0";
    }
  });

  // Hide sidebar when scrolling down
  window.addEventListener("scroll", function () {
    if (sidebar.style.left === "0px") {
      sidebar.style.left = "-250px";
      content.style.marginLeft = "0";
    }
  });

  // Prevent sidebar from closing when clicking on links inside it
  var sidebarLinks = document.querySelectorAll(".sidebarLinks");
  sidebarLinks.forEach(function (link) {
    link.addEventListener("click", function (event) {
      event.stopPropagation(); // Prevent the click event from reaching the document level
    });
  });
});
