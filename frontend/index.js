import { backend } from "declarations/backend";

let appointeesData = [];

async function loadAppointees() {
    try {
        document.getElementById('loading').style.display = 'block';
        appointeesData = await backend.getAppointees();
        renderAppointees(appointeesData);
    } catch (error) {
        console.error('Error loading appointees:', error);
    } finally {
        document.getElementById('loading').style.display = 'none';
    }
}

function renderAppointees(appointees) {
    const grid = document.getElementById('appointeesGrid');
    grid.innerHTML = '';

    appointees.forEach(appointee => {
        const card = document.createElement('div');
        card.className = 'col-lg-3 col-md-4 col-sm-6';
        card.innerHTML = `
            <div class="card h-100 appointee-card">
                <div class="card-img-container">
                    <img src="${appointee.imageUrl}" 
                         class="card-img-top" 
                         alt="${appointee.name}"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x500/1C2841/C5A572?text=${encodeURIComponent(appointee.name)}'">
                </div>
                <div class="card-body">
                    <h5 class="card-title">${appointee.name}</h5>
                    <p class="card-text">${appointee.position}</p>
                </div>
            </div>
        `;
        grid.appendChild(card);
    });
}

async function handleSearch(event) {
    const searchTerm = event.target.value.trim();
    if (searchTerm === '') {
        renderAppointees(appointeesData);
        return;
    }

    try {
        document.getElementById('loading').style.display = 'block';
        const results = await backend.searchAppointees(searchTerm);
        renderAppointees(results);
    } catch (error) {
        console.error('Error searching appointees:', error);
    } finally {
        document.getElementById('loading').style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    loadAppointees();
    document.getElementById('searchInput').addEventListener('input', handleSearch);
});
