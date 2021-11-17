import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";

const Router: React.FC = () => (
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<></>} />
    </Routes>
  </BrowserRouter>
);

export { Router };
