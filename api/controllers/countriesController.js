const Country = require("../models/country"); // Ensure your model is in the correct path

class CountriesController {
  // Get all countries
  async getAllCountries(req, res) {
    try {
      const countries = await Country.find(); // Retrieve all countries
      res.json(countries);
    } catch (error) {
      res.status(500).json({ error: "Error fetching countries" });
    }
  }

  // Get a country by ID
  async getCountryById(req, res) {
    try {
      const country = await Country.findById(req.params.id); // Find country by ID
      if (!country) {
        return res.status(404).json({ error: "Country not found" });
      }
      res.json(country);
    } catch (error) {
      res.status(500).json({ error: "Error fetching country" });
    }
  }

  // Create a new country
  async createCountry(req, res) {
    try {
      const country = new Country(req.body); // Create new country
      const savedCountry = await country.save(); // Save to database
      res.status(201).json(savedCountry); // Respond with created country
    } catch (error) {
      res.status(400).json({ error: "Error creating country" });
    }
  }

  // Update a country by ID
  async updateCountry(req, res) {
    try {
      const country = await Country.findByIdAndUpdate(
        req.params.id,
        req.body,
        { new: true } // Return the updated document
      );
      if (!country) {
        return res.status(404).json({ error: "Country not found" });
      }
      res.json(country); // Respond with updated country
    } catch (error) {
      res.status(400).json({ error: "Error updating country" });
    }
  }

  // Delete a country by ID
  async deleteCountry(req, res) {
    try {
      const country = await Country.findByIdAndDelete(req.params.id); // Delete country
      if (!country) {
        return res.status(404).json({ error: "Country not found" });
      }
      res.json({ message: "Country deleted" }); // Confirm deletion
    } catch (error) {
      res.status(500).json({ error: "Error deleting country" });
    }
  }
}

const countriesController = new CountriesController();

module.exports = countriesController;
