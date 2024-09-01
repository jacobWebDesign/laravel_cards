<script setup>
import { ref, computed } from 'vue';
import { usePage, router } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import {useRoute} from 'vue-router';


const { props } = usePage();
const cards = ref(props.cards);

const showModal = ref(false);
const currentCard = ref({
  id: null,
  card_number: '',
  balance: '',
  activation_date: '',
  expiration_date: '',
});

const deleteCard = (id) => {
  if (confirm('Are you sure you want to delete this card?')) {
    router.delete(route('cards.destroy', id));
  }
};

const nextPage = () => {
  if (cards.value.next_page_url) {
    router.visit(cards.value.next_page_url);
  }
};

const previousPage = () => {
  if (cards.value.prev_page_url) {
    router.visit(cards.value.prev_page_url);
  }
};

const editCard = (card) => {
  currentCard.value = { ...card };
  showModal.value = true;
};

const updateCard = () => {
  router.put(route('cards.update', currentCard.value.id), currentCard.value, {
    onSuccess: () => {
      showModal.value = false;
      router.visit(router.page.url);
    }
  });
};

</script>

<template>
  <AuthenticatedLayout>
    <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6 py-12 flex-col">
      <Link :href="route('cards.create')" class="bg-green-500 text-white py-2 px-4 rounded hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500">Add New Card</Link>

      <table class="min-w-full bg-white">
        <thead class="bg-gray-200">
          <tr>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Card Number</th>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Balance</th>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Activation Date</th>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Expiration Date</th>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Edit</th>
            <th class="py-2 px-4 text-left font-medium text-gray-700">Delete</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="card in cards.data" :key="card.id" class="border-t">
            <td class="py-2 px-4">{{ card.card_number }}</td>
            <td class="py-2 px-4">{{ card.balance }}</td>
            <td class="py-2 px-4">{{ card.activation_date }}</td>
            <td class="py-2 px-4">{{ card.expiration_date }}</td>
            <td class="py-2 px-4">
              <button @click="editCard(card)" class="bg-green-500 px-4 py-2 text-white">Edit</button>
            </td>
            <td class="py-2 px-4">
              <button @click="deleteCard(card.id)" class="bg-red-500 px-4 py-2 text-white">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Pagination buttons -->
      <div class="mt-3">
        <button @click="previousPage" :disabled="!cards.prev_page_url" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 mr-4">Previous</button>
        <button @click="nextPage" :disabled="!cards.next_page_url" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">Next</button>
      </div>
    </div>

    <!-- Edit Modal -->
    <div v-if="showModal" class="fixed z-10 inset-0 overflow-y-auto">
      <div class="flex items-center justify-center min-h-screen">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>

        <div class="bg-white rounded-lg overflow-hidden shadow-xl transform transition-all sm:max-w-lg sm:w-full p-6">
          <h3 class="text-lg leading-6 font-medium text-gray-900">Edit Card</h3>
          <div class="mt-2">
            <form @submit.prevent="updateCard">
              <div class="mt-4">
                <label class="block text-sm font-medium text-gray-700">Card Number</label>
                <input type="text" v-model="currentCard.card_number" class="form-input mt-1 block w-full" required />
              </div>
              <div class="mt-4">
                <label class="block text-sm font-medium text-gray-700">Balance</label>
                <input type="text" v-model="currentCard.balance" class="form-input mt-1 block w-full" required />
              </div>
              <div class="mt-4">
                <label class="block text-sm font-medium text-gray-700">Activation Date</label>
                <input type="datetime-local" v-model="currentCard.activation_date" class="form-input mt-1 block w-full" required />
              </div>
              <div class="mt-4">
                <label class="block text-sm font-medium text-gray-700">Expiration Date</label>
                <input type="datetime-local" v-model="currentCard.expiration_date" class="form-input mt-1 block w-full" required />
              </div>
              <div class="mt-6 flex justify-end">
                <button type="button" @click="showModal = false" class="btn btn-secondary me-2">Cancel</button>
                <button type="submit" class="btn btn-primary">Update</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>
