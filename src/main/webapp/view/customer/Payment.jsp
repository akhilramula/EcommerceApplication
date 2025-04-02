<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/header.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            color: #343a40;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .container {
            max-width: 700px;
            padding: 20px;
            background-color: white;
        }

        .text-muted {
            font-size: 0.9rem;
        }
    </style>
</head>

<body>
    <jsp:include page="./customermenu.jsp" />
    <br>
    <div class="container mt-5 card p-4">
        <h2 class="text-center mb-4">Payment Details</h2>
        <form name="f1" method="post" action="/EcommerceApplication/PaymentServlet">
            <!-- Account Number -->
            <div class="mb-3">
                <label for="accountNumber" class="form-label">Account Number</label>
                <input type="text" class="form-control" id="accountNumber" name="accountNumber" placeholder="Enter your account number" required>
            </div>

            <!-- Card Number -->
            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter your card number" required>
            </div>

            <!-- Card Type -->
            <div class="mb-3">
                <label for="cardType" class="form-label">Card Type</label>
                <select class="form-select" id="cardType" name="cardType" required>
                    <option value="" disabled selected>Select Card Type</option>
                    <option value="Credit">Credit Card</option>
                    <option value="Debit">Debit Card</option>
                </select>
            </div>

            <!-- CVV Number -->
            <div class="mb-3">
                <label for="cvvNumber" class="form-label">CVV Number</label>
                <input type="text" class="form-control" id="cvvNumber" name="cvvNumber" placeholder="Enter CVV" maxlength="4" required>
                <small class="text-muted">3 or 4-digit number on the back of your card</small>
            </div>

            <!-- Expiry Date -->
            <div class="mb-3">
                <label for="expiryDate" class="form-label">Expiry Date (MM/YY)</label>
                <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
            </div>

            <!-- Shipment Details -->
            <h3 class="text-center mt-4 mb-3">Shipment Details</h3>

            <!-- Delivery Address -->
            <div class="mb-3">
                <label for="deliverAddress" class="form-label">Delivery Address</label>
                <textarea class="form-control" id="deliverAddress" name="deliverAddress" rows="3" placeholder="Enter your delivery address" required></textarea>
            </div>

            <!-- Mobile Number -->
            <div class="mb-3">
                <label for="mobileNumber" class="form-label">Mobile Number</label>
                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter your mobile number" required>
            </div>

            <!-- Zip Code -->
            <div class="mb-3">
                <label for="zipCode" class="form-label">Zip Code</label>
                <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="Enter your zip code" required>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">Submit Payment</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
