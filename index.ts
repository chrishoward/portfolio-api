"use strict";
import express from "express";
import cors from "cors";
import pg from "pg";
import fs from "fs";

// Create new express app
const app = express();

// Create Postgres connection pool from environment variables
const pool = new pg.Pool();

const port = parseInt(process.env.API_PORT!);

// Middleware
app.use(cors());

// Request handlers
app.get("/", async (req, res) => {
  const sql = fs.readFileSync("read-data.sql").toString();
  const response = await pool.query(sql);
  res.send(response.rows[0].data);
});

app.listen(port, () => {
  console.log(`API is up and running.`);
});
