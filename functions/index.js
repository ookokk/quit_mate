const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const firestore = admin.firestore();

exports.saveUser = functions.https.onRequest(async (req, res) => {
  try {
    const data = req.body;
    const userID = req.params.userID;

    await firestore.collection('users').doc(userID).set(data);

    return res.status(200).send('User saved successfully');
  } catch (error) {
    console.error('Error saving user:', error);
    return res.status(500).send('Internal Server Error');
  }
});

exports.getUser = functions.https.onRequest(async (req, res) => {
  try {
    const userID = req.params.userID;

    const userDoc = await firestore.collection('users').doc(userID).get();

    if (userDoc.exists) {
      const userData = userDoc.data();
      return res.status(200).json(userData);
    } else {
      return res.status(404).send('User not found');
    }
  } catch (error) {
    console.error('Error getting user:', error);
    return res.status(500).send('Internal Server Error');
  }
});

exports.deleteUser = functions.https.onRequest(async (req, res) => {
  try {
    const userID = req.params.userID;

    await firestore.collection('users').doc(userID).delete();

    return res.status(200).send('User deleted successfully');
  } catch (error) {
    console.error('Error deleting user:', error);
    return res.status(500).send('Internal Server Error');
  }
});
