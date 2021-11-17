import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { Home } from "../pages/Home";

const Router: React.FC = () => (
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Home></Home>} />
    </Routes>
  </BrowserRouter>
);

export { Router };
