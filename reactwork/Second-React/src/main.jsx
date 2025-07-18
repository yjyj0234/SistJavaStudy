import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

import App from './App.jsx'
import OneApp from './components/OneApp.jsx'
import TwoApp from './components/TwoApp.jsx'
import QuizApp from './components/QuizApp.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
   {/*  <App /> */}
   {/* <OneApp/> */}
  {/* <TwoApp/>    */}
  <QuizApp/>
  </StrictMode>,
)
