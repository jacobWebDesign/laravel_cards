<template>
    <div>
      <h1>Edit Card</h1>
      <form @submit.prevent="submitForm">
        <div>
          <label for="card_number">Card Number:</label>
          <input v-model="form.card_number" type="text" id="card_number" required>
        </div>

        <div>
          <label for="pin">PIN:</label>
          <input v-model="form.pin" type="text" id="pin" required>
        </div>

        <div>
          <label for="activation_date">Activation Date:</label>
          <input v-model="form.activation_date" type="datetime-local" id="activation_date" required>
        </div>

        <div>
          <label for="expiration_date">Expiration Date:</label>
          <input v-model="form.expiration_date" type="datetime-local" id="expiration_date" required>
        </div>

        <div>
          <label for="balance">Balance:</label>
          <input v-model="form.balance" type="number" step="0.01" id="balance" required>
        </div>

        <button type="submit">Update Card</button>
      </form>
    </div>
  </template>

  <script setup>
  import { ref } from 'vue';
  import { usePage } from '@inertiajs/vue3';
  import { useForm } from '@inertiajs/vue3';

  const { props } = usePage();
  const card = props.card;

  const form = useForm({
    card_number: card.card_number,
    pin: card.pin,
    activation_date: card.activation_date,
    expiration_date: card.expiration_date,
    balance: card.balance
  });

  const submitForm = () => {
    form.put(route('cards.update', card.id));
  };
  </script>
