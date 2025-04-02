<style>
  /* Ensure the page takes up full height */
  body, html {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
  }

  /* Content container to grow and push the footer down */
  .content {
    flex: 1;
  }

  /* Footer styling */
  .footer {
    background-color: #343a40;
    color: #ffffff;
    padding: 20px 0;
    text-align: center;
  }

  .footer a {
    color: #ffffff;
    text-decoration: none;
  }

  .footer a:hover {
    color: #ff5722;
    text-decoration: underline;
  }

  .footer .social-icons a {
    font-size: 1.5rem;
    margin: 0 10px;
  }
</style>

<!-- Footer Structure -->
<footer class="footer mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>Welcome to our e-commerce platform. We provide the best products at affordable prices.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Follow Us</h5>
                <div class="social-icons">
                    <a href="#" class="text-light"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center mt-3">
            <p>&copy; 2024 E-commerce Platform. All rights reserved.</p>
        </div>
    </div>
</footer>

<script>
  // Add this JavaScript to automatically adjust the footer position for pages
  document.addEventListener("DOMContentLoaded", () => {
    const body = document.querySelector("body");
    const contentDiv = document.createElement("div");
    contentDiv.classList.add("content");
    // Wrap existing body content in a content container if it doesn't exist
    while (body.firstChild && body.firstChild !== body.lastChild) {
      contentDiv.appendChild(body.firstChild);
    }
    body.insertBefore(contentDiv, body.lastChild);
  });
</script>
