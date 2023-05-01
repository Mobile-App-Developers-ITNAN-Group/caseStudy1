window.addEventListener('DOMContentLoaded', (event) => {
    // Set invoice details
    document.getElementById('invoice-no').textContent = 'INV001';
    document.getElementById('billing-info').textContent = 'John Doe\n123 Main St\nCity, State, ZIP';
    document.getElementById('order-date').textContent = getCurrentDate();

    // Add products dynamically
    addProductRow('Product A', 2, 10.99);
    addProductRow('Product B', 1, 5.99);

    // Calculate and display invoice summary
    calculateInvoiceSummary();
});

function getCurrentDate() {
