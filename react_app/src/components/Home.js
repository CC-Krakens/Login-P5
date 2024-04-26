import React from 'react';
import { useLocation, useNavigate } from 'react-router-dom';

import axios from 'axios';

function Home() {
  const navigate = useNavigate();
  //Nombre de usuario
    const location = useLocation();
    const username = location.state.username;

  // Función para manejar el cierre de sesión
  const handleLogout = async () => {
    try {
      await axios.post('http://localhost:5000/logout', {
        withCredentials: true,
      });
    } catch (error) {
        alert(error);
    }
    navigate('/');
  };

  return (
    <div>
      <h1>Ciencias eats</h1>
      <p>Bienvenido, {username}.</p>
      <button onClick={handleLogout}>Log Out</button>
    </div>
  );
}

export default Home;
