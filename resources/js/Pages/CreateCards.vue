<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import { reactive } from 'vue'
import { router } from '@inertiajs/vue3'
import DangerButton from '@/Components/DangerButton.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
const form = reactive({
  card_number: '12341234123412341234',
  pin: "",
  expiration_date: '',
  balance: 0
})

function submit() {
  router.post('/cards', form)
}

</script>

<template>
    <Head title="Create a Card"/>

    <AuthenticatedLayout>


        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6 py-12">

    <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
    <form @submit.prevent="submit">

    <InputLabel for="card_number" value="Card Number" />
    <TextInput
        id="card_number"
        ref="card_number"
        v-model="form.card_number"
        type="text"
        class="mt-1 block w-3/4"
        placeholder="Kill me pls"
    />

      <InputLabel for="pin" value="Pin" />

      <TextInput
                        id="pin"
                        ref="1234"
                        v-model="form.pin"
                        type="text"
                        class="mt-1 block w-3/4"
                        placeholder="Enter your 4-digit Pin"

                    />


      <InputLabel for="activation_date" value="Activation Date" />

      <TextInput
                        id="activation_date"
                        ref=""
                        v-model="form.activation_date"
                        type="datetime-local"
                        class="mt-1 block w-3/4"
                        placeholder="I love being dead"

                    />


      <InputLabel for="expiration_date" value="Expiration Date" />
      <TextInput
                        id="expiration_date"
                        ref=""
                        v-model="form.expiration_date"
                        type="datetime-local"
                        class="mt-1 block w-3/4"
                        placeholder="I love being dead"

                    />



    <InputLabel for="balance" value="Balance" />
    <TextInput
                        id="balance"
                        ref=""
                        v-model="form.balance"
                        type="text"
                        class="mt-1 block w-3/4"
                        placeholder="I love being dead"

                    />


    <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">Create Card</PrimaryButton>
    </form>
  </div>
</div>

    </AuthenticatedLayout>
</template>
