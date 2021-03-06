import {useContext} from 'react'
import { Link } from 'react-router-dom';
import { userContext } from "../user/UserProvider.js";
const logo = require('../../images/logo.png')

export default function Header() {
    const {userEmail, userState,} = useContext(userContext)

    return (
        <nav
            className="navbar navbar-expand-lg navbar-light bg-light"
            style={{ height: "80px", backgroundColor: "#e3f2fd" }}
        >
            <div className="container-fluid">
                
                <img src={logo} alt="logo" style={{ height: "35px" }} />
                <Link className="navbar-brand" to="home">&nbsp;PET FINDER</Link>
                <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span className="navbar-toggler-icon"></span>
                </button>

                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link active" aria-current="page" to="home">Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link active" to="about" state={"About Us"}>About</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link active" to="about" state={"Contact Us"}>Contact Us</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link active" to="Feedback">Feedback</Link>
                        </li>

                        <li className="nav-item dropdown">
                            <a className="nav-link dropdown-toggle" href="/services" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                                Services
                            </a>
                            <ul className="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <Link className="dropdown-item" to="testimonials/" state={"Testimonials"}>Testimonials</Link>
                                </li>
                                <li>
                                    <Link className="dropdown-item" to="lost_found">Lost & Found</Link>
                                </li>
                                {/* <li><hr className="dropdown-divider" /></li> */}
                                <li>
                                    <Link className="dropdown-item" to="create_listing">Create Listing</Link>
                                </li>

                            </ul>
                        </li>
                    </ul>
                </div>


                
                <span>{userEmail}</span>
                <div className="dropdown">
                    <button
                        type="button"
                        id="dropdownMenuLink"
                        className="btn btn-light dropdown-toggle"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        // onClick={console.log("test")}
                    >
                        User
                    </button>
                    <ul className="dropdown-menu dropdown-menu-end dropdown-menu-lg-star">
                        <Link
                            className={`dropdown-item ${userState === false ? "" : "disabled"}`}
                            to="users/login"
                            state={'User Login'}
                        >
                            Login
                        </Link>
                        <li>
                            <Link className={`dropdown-item ${userState === true ? "" : "disabled"}`} to="users/logout" state={'User Account'}>
                                Logout
                            </Link>
                        </li>
                        <li>
                            <hr className="dropdown-divider" />
                        </li>
                        <Link className={`dropdown-item ${userState === true ? "" : "disabled"}`}
                            to="users/account"
                            state={'User Account'}
                        >
                            Account
                        </Link>

                        <Link className={`dropdown-item ${userState === false ? "" : "disabled"}`}
                            to="users/signup"
                            state={'User Signup'}
                        >
                            Signup Now
                        </Link>
                    </ul>
                </div>
            </div>
        </nav>
    );
}
