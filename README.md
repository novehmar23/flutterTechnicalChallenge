# Flutter Technical Challenge - Public API Data Display

## Objective
Create a Flutter app that interacts with a public REST API, fetches data, and displays it in a user-friendly way.

## Requirements
1. **Fetch data from a public API** (e.g., [JSONPlaceholder](https://jsonplaceholder.typicode.com/)) and display it in a list.
2. Each item in the list displays the title or main information from the API response.
3. When a user taps an item in the list, navigate to a details screen showing more information about the selected item.
4. Use a state management solution (**Provider**).
5. Use **MVVM + Repository** architecture.
6. Ensure a responsive and clean UI that works on both Android and iOS devices.
7. Handle loading states and error states gracefully.

### API Endpoints
- **List of posts**: `https://jsonplaceholder.typicode.com/posts`
- **Post details** (by ID): `https://jsonplaceholder.typicode.com/posts/{id}`

## Functional Requirements
### Home Screen:
- Fetch and display a list of posts.
- Display a loading indicator while fetching data.
- Show an error message if the API request fails.

### Details Screen:
- When a user taps an item in the list, navigate to a details screen.
- Fetch details for the selected post.
- Display the title and body of the post.
- Show a loading indicator while fetching details.
- Handle and display any error message if the API request fails.

## Bonus Points
1. Implement a **search bar** to filter the list by the post title.
2. Implement **pagination** to fetch and display posts in chunks.
3. Add a **unit test** for the API fetching logic.

## How to Run the Project
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/flutter-technical-challenge.git
   cd flutter-technical-challenge
